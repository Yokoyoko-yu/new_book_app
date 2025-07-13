class AwardTitlesController < ApplicationController

    def show 
        award_title_id=params[:id]
        award_book_contents=FetchBooksTableData.fetch(award_title_id)
        render json: award_book_contents, status: :ok
    end
    
end
