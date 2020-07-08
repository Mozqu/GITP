class CommunitiesController < ApplicationController
  def index
  end

  def new

  end

  def show
    @community = Community.find_by(id: params[:id])
  end

  def create
    @community = Community.new(
      community_name: params[:name],
      rule: params[:rule],
      introduce: params[:introduce],
      published: @current_user.id,
      is_open: params[:isOpen?]
    )
    if @community.save
      redirect_to("/communities/#{@community.id}")
    else
      render("/communities/create_form")
    end
  end

  def home
    @community = Community.find_by(id: params[:id])
  end

  def board
    @community = Community.find_by(id: params[:id])
    @boards = Board.where(community: @community.id).order(created_at: :desc)
  end

  def member
    @community = Community.find_by(id: params[:id])

  end

  def media
    @community = Community.find_by(id: params[:id])

  end

  def add_member
    @community = Community.find_by(id: params[:id])
    @commu_member = CommunityMember.create(
      community_id: params[:id],
      user_id: @current_user.id,
      authority: "none",
      allowed: "done"
    )

  end

  def remove_member
    @community = Community.find_by(id: params[:id])
    @commu_member = CommunityMember.find_by(community_id: params[:id], user_id: @current_user.id)
    @commu_member.destroy

  end

end
