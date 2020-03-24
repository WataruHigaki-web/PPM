class Admins::ProductKindsController < ApplicationController
  def index
    @product_kind = ProductKind.new
    @product_kinds = ProductKind.all
  end
  
  def create
    product_kind = ProductKind.new(product_kind_params)
    if product_kind.save
      flash[:notice] = "「#{product_kind.name}」ジャンル作成しました"
      redirect_to admins_product_kinds_path
    else
      render 'new'
    end
  end
  
  def edit
    @product_kind = ProductKind.find(params[:id])
  end

  def update
    product_kind = ProductKind.find(params[:id])
    if product_kind.update(product_kind_params)
      flash[:notice] = "ジャンル編集完了しました"
      redirect_to admins_product_kinds_path
    else
      render 'edit'
    end
  end

  def destroy
    product_kind = ProductKind.find(params[:id])
    product_kind.destroy
    flash[:notice] ="「#{product_kind.name}」ジャンル削除完了しました"
    redirect_to admins_product_kinds_path
  end

  private

  def product_kind_params
    params.require(:product_kind).permit(:name,:status)
  end
end
