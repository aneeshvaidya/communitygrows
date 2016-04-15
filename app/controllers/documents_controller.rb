class DocumentsController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def file_params
      params.require(:file).permit(:title, :url, :committee)
    end
  
    def index
    end
    
    def create_file
        #puts Document.where(:committee => 'executive')
        begin
            if params[:title].to_s == "" or params[:url].to_s == ""
                flash[:notice] = "Populate all fields before submission."
                puts "this is wahts going on "
                redirect_to new_file_path
            else 
                @file = Document.create!(file_params)
                flash[:notice] = "#{@file.title} was successfully created."
                redirect_to documents_path 
            end
        end
    end
    
    def delete_file
        
        
    end
    
    def new_file
        #default: render 'new' template
    end
end