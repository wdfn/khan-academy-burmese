class VideosController < ApplicationController

	def video_setup
		@user = User.find_by_id(params[:id])

		@avail_trans = Video.where(:translator_id => nil, :translate_complete => false)
		@avail_digi = Video.where('typer_id IS NULL AND translator_id IS NOT NULL AND translate_complete = ? and type_complete = ? AND translator_id != ?', true, false, @user.id)
		@avail_qa = Video.where('qa_id IS NULL AND typer_id IS NOT NULL AND type_complete = ? AND qa_complete = ? AND translator_id != ? AND typer_id != ?', true, false, @user.id, @user.id)
		@avail = @avail_trans + @avail_digi + @avail_qa

		@trans_vids = Video.where(:translate_complete => false, :translator_id => @user.id)
		@digi_vids  = Video.where(:type_complete => false, :typer_id => @user.id)
		@qa_vids = Video.where(:qa_complete => false, :qa_id => @user.id)

		@comp_trans = Video.where(:translate_complete => true, :translator_id => @user.id)
		@comp_digi = Video.where('type_complete = ? AND typer_id = ? AND translator_id != ?', true, @user.id, @user.id)
		@comp_qa = Video.where(:qa_complete => true, :qa_id => @user.id)
		@comp = @comp_trans + @comp_digi + @comp_qa
	end

	def available
		video_setup()
	end

	def translate
		video_setup()
	end

	def digitize
		video_setup()
	end

	def qa
		video_setup()
	end

	def completed
		video_setup()
	end

end
