module V1
  class ContactsController < ApplicationController
    include ErrorSerializer
    before_action :set_contact, only: [:show, :update, :destroy] 
    # GET /contacts
    def index
      @contacts = Contact.all.page(params[:page].try(:[], :number))
                                  .per(params[:page].try(:[], :size))
      
      if stale?(etag: @contacts)
        render json: @contacts
      end
    end 
    # GET /contacts/1
    def show
      render json: @contact
    end
    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], 
          status: :created, location: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors)
      end
    end
    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: ErrorSerializer.serialize(@contact.errors)
      end
    end
    
    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        params.require(:contact).permit(
          ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        )
      end
  end
end
