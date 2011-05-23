class NotesController < ApplicationController
	stream
	respond_to :html, :json, :xml

	def index
		@notes = current_user.notes.page(params[:page])
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def delete
	end
end
