class EntriesController < ApplicationController
  load_and_authorize_resource

  def index
    @entries = Entry.all.reverse
    @entry = Entry.new
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to entries_path, notice: 'Entry was successfully created'
    else
      redirect_to entries_path, notice: 'Unfortunately action wasnt done'
    end
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :body, :thumbnail)
    end
end
