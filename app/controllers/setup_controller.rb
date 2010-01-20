class SetupController < ApplicationController
  
  before_filter :check_setup, :except=>"index"
  
  def index
    if User.table_exists?
      
    else
      redirect_to "/setup/fresh_install"
    end
  end

  def fresh_install
    
  end
  
  def step1
    install_db
    User.create(params[:user])
  end


  private 
  
  def check_setup
    if User.table_exists? && User.first != nil
      flash[:warning] = "Setup has already been run."
      redirect_to '/setup'
    end
  end
  
  def upgrade_db
    `rake db:migrate`
  end
  
  def install_db
    `rake db:schema:laod`
  end

  def re_install_db
    `rake db:reset`
  end
  
end