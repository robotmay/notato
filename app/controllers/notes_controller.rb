class NotesController < ApplicationController
	stream
	respond_to :html, :json, :xml

	before_filter do
		@notepatch = Notepatch.find!(params[:notepatch_id]) unless params[:notepatch_id].nil?
		authorize! :read, @notepatch
	end

	def index
		@notes = current_user.notes.page(params[:page])
		respond_with @notes
	end

	def show
		@note = @notepatch.notes.find(params[:id])
		authorize! :read, @note
		respond_with @note
	end

	def new
		@note = @notepatch.notes.new
		authorize! :create, @note
		respond_with @note
	end

	def create
		@note = @notepatch.notes.new(params[:note])
		authorize! :create, @note
		if @note.save
			respond_with @note, status: :ok do |f|
				f.html { redirect_to notepatch_note_path(@notepatch, @note), notice: t(:note_create_success) }
			end
		else
			respond_with @note, status: :unprocessable_entity do |f|
				f.html { render :new, alert: t(:note_create_failure) }
			end
		end
	end

	def edit
		@note = @notepatch.notes.find(params[:id])
		authorize! :update, @note
		respond_with @note
	end

	def update
		@note = @notepatch.notes.find(params[:id])
		authorize! :update, @note
		if @note.update_attributes(params[:note])
			respond_with @note, status: :ok do |f|
				f.html { redirect_to notepatch_note_path(@notepatch, @note), notice: t(:note_update_success) }
			end
		else
			respond_with @note, status: :unprocessable_entity do |f|
				f.html { render :edit, alert: t(:note_update_failure) }
			end
		end
	end

	def delete
		@note = @notepatch.notes.find(params[:id])
		authorize! :destroy, @note
		if @note.destroy
			respond_with @note, status: :ok do |f|
				f.html { redirect_to notepatch_notes_path(@notepatch), notice: t(:note_destroy_success) }
			end
		else
			respond_with @note, status: :unprocessable_entity do |f|
				f.html { redirect :back, alert: t(:note_destroy_failure) }
			end
		end
	end
end
