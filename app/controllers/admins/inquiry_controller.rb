class Admins::InquiryController < ApplicationController
 def index
    @end_user = @inquiry.name
    end

    def show
        @inquiry = Inquiry.find(params[:id])
    end

    def update
        inquiry = Inquiry.find(params[:id]) #inquiry_mailer.rbの引数を指定
        inquiry.update(inquiry_params)
        end_user = inquiry.end_user
        InquiryMailer.send_when_admin_reply(end_user, inquiry).deliver_now #確認メールを送信
        redirect_to admins_inquiries_path
    end

    def destroy
        inquiry = Inquiry.find(params[:id])
        inquiry.destroy
        @inquirys = Inquiry.page(params[:page]).order(created_at: :desc).per(16)
        @end_users = end_user.all
        render :index
    end

    private
    def inquiry_params
        params.require(:inquiry).permit(:title, :body, :end_user_id)
    end
end
