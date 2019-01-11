class TicketsController < ApplicationController
  def index
    if params[:search] == :cancel.to_s
      search_ticket
    elsif params[:search] == :search.to_s
      search_all_tickets
    end
  end

  def new; end

  def edit; end

  def update
    if params[:status] == "cancel"
      @ticket = find_ticket params[:id]

      @ticket.status_cancel! 

      flash.now[:danger] = t ".cancel_fail" unless @ticket.status_cancel?
      redirect_to request.referrer
    elsif params[:status] == "paid"
      @tickets = []
      params[:id_tickets].split.each do |id|
        @ticket = find_ticket id
        @ticket.status_paid! if @ticket.status_pending?
        @tickets << @ticket
      end

      if @ticket.customer.email.present?
        CustomerMailer.customer_email(@ticket.customer, @tickets).deliver_now
      end
      render "tickets/after_pay"
    end
  end

  private

  def find_ticket id
    @ticket = Ticket.find_by id: id
  end

  def search_ticket
    return unless params[:code].present? && params[:phone_number].present?
    @ticket = Ticket.join_customer.search_ticket(params[:code],
      params[:phone_number]).first

    flash.now[:danger] = t ".not_phone_ticket" unless @ticket
  end

  def search_all_tickets
    return unless params[:phone_number].present?
    @tickets = Ticket.join_customer
      .search_ticket(nil, params[:phone_number]).sorted

    flash.now[:danger] = t ".not_phone" if @tickets.blank?
  end
end
