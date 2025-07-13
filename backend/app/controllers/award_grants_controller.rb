class AwardGrantsController < ApplicationController
    def search
        user_id=current_user.id
        award_id=params[:award_id]
        data=FetchUserAwardBooks.fetch(user_id,award_id)
        render json:data
    end
end
