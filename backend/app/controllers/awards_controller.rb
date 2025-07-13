class AwardsController < ApplicationController
    #賞の一覧
    def index
        @award=Award.all
        render json:{awards:@award}
    end

    def show
        award_id=params[:id]
        award=Award.find_by(id:award_id)
        award_book_data=FetchAwardBookData.fetch(award_id)
        render json:{award:award,awards_books:award_book_data}
    end




end
