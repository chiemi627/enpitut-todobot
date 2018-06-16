class TodoController < ApplicationController
  require 'net/https'

  protect_from_forgery except: [:add_task]
  
  def add_task
    if params[:queryResult] then
      message = params[:queryResult][:parameters][:task]
      uri = URI.parse("https://hooks.todobot.io/iRliKmeGrg")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data({text: message})
      res = http.request(req)

      speech_str="タスク「"+message+"」を追加しました"
    else
      speech_str="タスクの読み込みに失敗しました"
    end
      
    respond_to do |format|
      format.html
      format.json { render json: {fulfillmentText: speech_str}}
    end
  end
end
