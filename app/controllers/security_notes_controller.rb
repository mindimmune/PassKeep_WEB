class SecurityNotesController < ApplicationController
  def list
    render json: {notes: current_user.security_notes}
  end

  def new
    new_note = SecurityNote.new
    new_note.values.build key: 'User Name', value: ""
    new_note.values.build key: 'Password', value: "", hidden: true
    render json: new_note, include: {values: {only: [:key, :value, :hidden]}}, only: :title
  end

  def create
    note = SecurityNote.new title: security_note_params[:title], user_id: current_user.id
    security_note_params[:values].each do |value_params|
      note.values.build value_params
    end
    render json: {success: true}
  end

  def security_note_params
    params.require(:security_note).permit(:title, values: [:key, :value, :hidden])
  end
end
