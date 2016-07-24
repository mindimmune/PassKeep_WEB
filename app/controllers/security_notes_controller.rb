class SecurityNotesController < ApplicationController
  def list
    render json: current_user.security_notes.each_slice(6).to_a, only: [:id, :title]
  end

  def new
    new_note = SecurityNote.new(values_attributes: [{key: t("labels.email")},
                                                    {key: t("labels.password"), hidden: true}])
    render text: security_note_json(new_note)
  end

  def create
    note = SecurityNote.new security_note_params
    render json: {success: note.save}
  end

  def edit
    note = SecurityNote.find(params[:id])
    render text: security_note_json(note)
  end

  def update
    render json: {success: SecurityNote.find(params[:id])&.update_attributes(security_note_params)}
  end

  def destroy
    render json: {success: SecurityNote.find(params[:id])&.destroy}
  end

  private

  def security_note_params
    params.require(:security_note)
          .permit(:title, :order, values_attributes: [:id, :key, :value, :hidden, :order])
          .merge(user_id: current_user.id)
  end

  def security_note_json(note)
    note.to_json(include: {values: {only: [:id, :key, :value, :hidden, :order]}}, only: [:title, :id, :order])
        .sub "\"values\":", "\"values_attributes\":"
  end
end
