class TicketsController < ApplicationController
  before_action :find_ticket, only: %i(update)

  def new; end

  def index
    return unless params[:id].present? && params[:phone_number].present?
    @tickets = Ticket.join_customer.search_ticket(params[:id],
      params[:phone_number]).first
  end

  def edit; end

  def update
    @ticket.status_cancel!
    redirect_to request.referrer
  end

  private
  def find_ticket
    @ticket = Ticket.find_by id: params[:id]
    return if @ticket
    flash[:danger] = t ".error"
    redirect_to root_url
  end
end
