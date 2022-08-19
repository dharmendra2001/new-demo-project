class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  #skip_before_action :authenticate_user!, only: :index
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
    # got params[:time] into time
    t=params.require(:user).permit(:time)
    str = t.inspect
    ar=str.split('"')
    time= ar[3]

    t=params.require(:user).permit(:inter)
    str = t.inspect
    ar=str.split('"')
    inter= ar[3]

    if time_checks_out(time,inter)

     @update_admin = User.find(params[:id])
    if @update_admin.update(params.require(:user).permit(:name,:email,:passwords,:date,:admin_date,:inter,:time,:first,:second,:third))
      redirect_to admins_path 
    else
      redirect_to admin2_path
    end
    else
      flash[:error]="Time is already taken"
      redirect_to admin2_path
    end
  end


  def track
    @track = User.find(params[:id])
  end

  def result
    @result = User.find(params[:id])
  end

  def interinfo
    if user_signed_in?
      @interinfo = User.where(inter: current_user.name)
    end
  end

  def update_user_data
    @update_user_datas = User.find(params[:id])
  end

  def admin_update
    @admin_update = User.find(params[:id])

    if @admin_update.update(params.require(:user).permit(:user_type))
      redirect_to detail_path
    else
      redirect_to update_user_data_path
    end
  end

  def riview
    @riview = User.find(params[:id])
  end

  def riview_update
    @riview_update = User.find(params[:id])

    if @riview_update.update(params.require(:user).permit(:riview))
      redirect_to interinfo_path(@riview_update)
    else
      redirect_to riview_path
    end
  end

  def create_drive
    # @create_drive = Drive.new
  end

  def drive_save
    debugger
    Drive.create(drive_date: params[:drive_date], role: params[:role])
    redirect_to admins_path
  end


  private
  
  def time_checks_out(t,s)
  condition = true
  unless t.nil?
    #converts time string into int ex:- 6:30 to 630
    ar3 = t.split(':')
    i3=ar3[0].to_i*100
    i3=i3+ar3[1].to_i
    t=i3

    ar = User.where(inter:s).pluck(:time)
   
    ar.each do |i|
     unless i.nil?
        ar2 = i.split(':')
        i2=ar2[0].to_i*100
        i2=i2+ar2[1].to_i
        
        if t.between?(i2,i2+100)
          condition = false
          break
       end
      end
    end
  end
  return condition
end

end
