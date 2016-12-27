require_dependency "noodle/application_controller"
# @see https://blog.codeship.com/the-json-api-spec/
# @see http://ieftimov.com/sprinkle-some-hateoas-on-rails-apis
# @see http://stackoverflow.com/questions/30158710/how-to-write-a-spec-to-check-if-a-record-is-saved-in-the-database-using-rspec-wi
module Noodle
  class NodesController < ApplicationController
    before_action :set_node, only: [:show, :edit, :update, :destroy]

    # GET /nodes
    def index
      @nodes = Node.all
    end

    # GET /nodes/1
    def show
    end

    # GET /nodes/new
    def new
      @node = Node.new
    end

    # GET /nodes/1/edit
    def edit
    end

    # POST /nodes
    def create
      @node = Factories::Node.create(referral_params[:service], referral_params[:class], referral_params[:properties].to_json)
      @node.save

      render :status => :created, json: {}.to_json
    end

    # PATCH/PUT /nodes/1
    def update
      if @node.update(node_params)
        redirect_to @node, notice: 'Node was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /nodes/1
    def destroy
      @node.destroy
      redirect_to nodes_url, notice: 'Node was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_node
        @node = Node.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def node_params
        # @see http://stackoverflow.com/questions/15919761/rails-4-nested-attributes-unpermitted-parameters
        params.require(:node).permit(:service, :class, :properties)
      end
      
      def referral_params
        json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
        params.require(:node).tap do |whitelisted|
          whitelisted[:properties] = params[:node][:properties]
        end
      end
  end
end
