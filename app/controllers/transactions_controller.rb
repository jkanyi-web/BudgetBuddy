class TransactionsController < ApplicationController
  load_and_authorize_resource :category
  load_and_authorize_resource :transaction, through: :category

  # GET /transactions or /transactions.json
  def index
    @transactions = @category.transactions
      .where(category_id: current_user.categories.pluck(:id))
      .order(created_at: :desc)
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])
    authorize! :read, @transaction
  end

  # GET /transactions/new
  def new
    @transaction = @category.transactions.build
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions or /transactions.json
  def create
    @transaction = @category.transactions.build(transaction_params)
    @transaction.user = current_user

    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to category_transaction_url(@category, @transaction),
                      notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.turbo_stream do
          redirect_to category_transaction_url(@transaction.category, @transaction),
                      notice: 'Transaction was successfully updated.'
        end
        format.html do
          redirect_to category_transaction_url(@transaction.category, @transaction),
                      notice: 'Transaction was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.turbo_stream { render :edit, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    category = @transaction.category
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to category_transactions_url(category), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :category_id, :user_id)
  end
end
