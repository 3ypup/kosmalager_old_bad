class EventsController < ApplicationController

def rusdate

  @rusdate = %w[января, февраля, марта, апреля, мая, июня, июля, августа, сентября, октября, ноября, декабря ]



end


def index
  @events = Event.order(:date)
  


   
  @bckg = "/img/home.jpg"
  @title = "Предстоящие события"
  @label = "Храма свв. бесср. Космы и Дамиана"
end




    def new

      @bckg = "/img/home.jpg"
      @title = "Новое событие"
      @label = ""
    end

    def create

      @event = Event.new(event_params)
        
        if  @event.save
          redirect_to @event
        else
          render action: 'new'
        end
    end

  def show
    @event = Event.find(params[:id])


    @bckg = @event.image

    @title = @event.title

    @label =""

  end

def event_params
    params.require(:event).permit(:author, :content, :title, :image, :date)
  end


end
