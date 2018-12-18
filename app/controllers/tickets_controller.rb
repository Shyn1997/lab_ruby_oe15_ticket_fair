class TicketsController < ApplicationController
  before_action :find_ticket, only: %i(update)

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
    @ticket.status_cancel!
    
    if @ticket.status_activite?
      flash.now[:danger] = t ".cancel_fail"
    end
    redirect_to request.referrer
  end

  private

  def find_ticket
    @ticket = Ticket.find_by id: params[:id]

    return if @ticket
    flash[:danger] = t ".error"
    redirect_to root_url
  end

  def search_ticket
    return unless params[:id].present? && params[:phone_number].present?
    @ticket = Ticket.join_customer.search_ticket(params[:id],
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
