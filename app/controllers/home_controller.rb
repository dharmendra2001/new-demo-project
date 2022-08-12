class HomeController < ApplicationController
  def index
  end

  def detail 
    @a = User.all
    if flash[:redirect]=='1'
      redirect_to root_path
    end
  end

  def candidate 
    @candidates = User.find(params[:id])
  end

  def drive
    @drives = User.find(params[:id])
  end

  def fillform
    @drives = User.find(params[:id])
    @drives = User.find_by(name: params[:name], email: params[:email])
    if @drives.candidates.create(date: params[:date])
        redirect_to root_path
    else
        redirect_to root_path
    end
  end

  def date
    @dates = Candidate.where(date: params[:data])
  end


  def admins 
  end

  def admin2 
    @admin2 = User.find(params[:id])
  end

  def admin3
    @update_admin = User.find(params[:id])
  #  @update_admin = User.find_by(name: params[:name], email: params[:email])
    if @update_admin.update(params.require(:user).permit(:name,:email,:passwords,:date,:admin_date,:inter,:time,:first,:second,:third))
      redirect_to admins_path 
    else
      redirect_to admin2_path
    end
  end

  def track
    @track = User.find(params[:id])
  end

  def result
    @result = User.find(params[:id])
  end

end
