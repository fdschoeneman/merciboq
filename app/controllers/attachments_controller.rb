class AttachmentsController < ApplicationController
  def show
    attachment = Attachment.find params[:id]
    send_data attachment.bytes, :filename => attachment.filename, :type => attachment.mimetype, :disposition => 'inline'
  end
end

