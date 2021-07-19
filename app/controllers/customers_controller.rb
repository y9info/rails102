class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [ :index, :show, :new ,:edit, :update, :destroy ]
  before_action :find_customer_and_check_permission, only: [ :show, :edit, :update, :destroy ]
  # GET /customers or /customers.json
  def index
      @my_customers = Customer.where(user_id: current_user.id)

  end

  # GET /customers/1 or /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    @tracks = @customer.tracks
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: "新建客户成功！" }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: "更新客户信息成功！" }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:user_id, :short_name, :origin, :sq, :level, :full_name, :linkman, :address, :phone, :fax, :mobile, :email, :website, :main_purchase, :track_result, :note)
    end

    def find_customer_and_check_permission
      set_customer
      if current_user != @customer.user
        flash[:notice] = "没有权限，非管理员用户仅能查阅、编辑、修改自己的客户！"
        redirect_to root_path
      end
    end

end
