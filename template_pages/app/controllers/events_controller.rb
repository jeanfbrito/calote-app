class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start_at: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :date_range, :color, :title, :start_at, :situation,
        :end_at, :color, :number, :description, :location,
        :president_id, :secretary_id, :forum_id, :address,
        :user_id, user_ids: [],
        subjects_attributes: [:id, :description, :title, :answerable, :time, :_destroy, files: [] ])
    end
end
