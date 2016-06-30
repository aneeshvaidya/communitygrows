class EventsController < ApplicationController
    layout "base"
    before_filter :authenticate_user!
    
    def event_params
        params.require(:event).permit(:title, :location, :description, :date)
    end
    
    def new
    end
    
    def create
        @title = event_params[:title]
        @location = event_params[:location]
        @description = event_params[:description]
        @date = event_params[:date]
        @url = event_params[:url]
        
        if @title.empty?
            flash[:notice] = "Title field cannot be left blank."
            redirect_to a_new_event_path and return
        end
        #Date.valid_date? *date_string.split('-').reverse.map(&:to_i)
       # @dateArr = @date.split('-').reverse.map(&:to_i)
        
        if @date.empty?
            flash[:notice] = "Date field cannot be left blank."
            redirect_to a_new_event_path and return
        end
        begin
            if !Date.valid_date? *@date.split('-').map(&:to_i)
                flash[:notice] = "Date must be formated as YYYY-MM-DD  HH:mm(AM/PM) no parentheses"
                redirect_to a_new_event_path and return
            end
        rescue ArgumentError
            flash[:notice] = "Date was not correctly formatted, please follow provided format."
            redirect_to a_new_event_path and return
        end
        
        begin
            if !(@url=~/.com(.*)/)
                flash[:notice] = "Please enter a valid URL."
                redirect_to a_new_event_path and return
            else 
                if !(@url=~/http(s)?:/)
                    @url="http://"+@url
                end
            end
        end
        
        @event = Event.create(event_params)
        @event.save!
        flash[:notice] = "Event titled #{@title} created successfully."
        redirect_to admin_index_path
    end
    
    def edit
        @event = Event.find params[:id]
    end

    def update
        @event = Event.find params[:id]
        @title = event_params[:title]
        @date = event_params[:date]
        if @title.empty?
            flash[:notice] = "Title field cannot be left blank."
            redirect_to edit_event_path(@event.id) and return
        end
        #Date.valid_date? *date_string.split('-').reverse.map(&:to_i)
       # @dateArr = @date.split('-').reverse.map(&:to_i)
        
        if @date.empty?
            flash[:notice] = "Date field cannot be left blank."
            redirect_to edit_event_path(@event.id) and return
        end
        begin
            if !Date.valid_date? *@date.split('-').map(&:to_i)
                flash[:notice] = "Date must be formated as YYYY-MM-DD  HH:mm(AM/PM) no parentheses"
                redirect_to edit_event_path(@event.id) and return
            end
        rescue ArgumentError
            flash[:notice] = "Date was inproperly formatted, please follow provided format."
            redirect_to edit_event_path(@event.id) and return
        end
        @event.update_attributes!(event_params)
        redirect_to admin_index_path 
    end
    
    def delete
        @event = Event.find params[:id]
        @event.destroy
        redirect_to admin_index_path
    end
    
end
