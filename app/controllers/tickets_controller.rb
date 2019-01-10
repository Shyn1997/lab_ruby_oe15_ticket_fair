class TicketsController < ApplicationController
<<<<<<< HEAD
  before_action :find_ticket, only: %i(update)

=======
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
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
<<<<<<< HEAD
    @ticket.status_cancel!

    if @ticket.status_pending?
      flash.now[:danger] = t ".cancel_fail"
    end
    redirect_to request.referrer
=======
    if params[:status] == "cancel"
      @ticket = Ticket.find_by id: params[:id]

      @ticket.status_cancel!

      if @ticket.status_pending?
        flash.now[:danger] = t ".cancel_fail"
      end
      redirect_to request.referrer
    elsif params[:status] == "paid"
      @tickets = []
      params[:id_tickets].split.each do |id|
        @ticket = Ticket.find_by id: id
        @ticket.status_paid! if @ticket.status_pending?
        @tickets << @ticket
      end
      CustomerMailer.customer_email(@ticket.customer, @tickets).deliver_now if @ticket.customer.email.present?
      render "tickets/after_pay"
    end
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
  end

  private

<<<<<<< HEAD
  def find_ticket
    @ticket = Ticket.find_by id: params[:id]

    return if @ticket
    flash[:danger] = t ".error"
    redirect_to root_url
  end

=======
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
  def search_ticket
    return unless params[:code].present? && params[:phone_number].present?
    @ticket = Ticket.join_customer.search_ticket(params[:code],
      params[:phone_number]).first

      if @ticket.nil?
      flash.now[:danger] = t ".not_phone_ticket"
    end
  end

  def search_all_tickets
    return unless params[:phone_number].present?
    @tickets = Ticket.join_customer.search_ticket(nil, params[:phone_number]).sorted

    if @tickets.blank?
      flash.now[:danger] = t ".not_phone"
    end
  end
end
