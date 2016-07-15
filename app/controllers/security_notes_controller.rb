class SecurityNotesController < ApplicationController
  def index
    render json: {"aaa" => "bbb"}
  end

  def new
    new_note = SecurityNote.new
    new_note.values << [SecurityNoteValue.new(key: 'User Name', value: "test@email.com"),
                        SecurityNoteValue.new(key: 'Password', value: "foobar")]
    render json: new_note, include: {values: {only: [:key, :value, :hidden]}}, only: :title
  end

  def create
    byebug
    a = params
  end
end
