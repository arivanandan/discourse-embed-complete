require_dependency 'embed_controller'

class ::EmbedController
  def comments
    include_first = SiteSetting.embed_complete_enabled
    count_diff = include_first ? 0 : 1;

    embed_url = params[:embed_url]
    embed_username = params[:discourse_username]
    
    topic_id = nil
    if embed_url.present?
      topic_id = TopicEmbed.topic_id_for_embed(embed_url)
    else
      topic_id = params[:topic_id].to_i
    end

    if topic_id
      @topic_view = TopicView.new(topic_id,
                                  current_user,
                                  limit: SiteSetting.embed_post_limit,
                                  only_regular: true,
                                  exclude_first: !include_first,
                                  exclude_deleted_users: true,
                                  exclude_hidden: true)

      @second_post_url = "#{@topic_view.topic.url}/#{count_diff + 1}" if @topic_view
      @posts_left = 0
      if @topic_view && @topic_view.posts.size == SiteSetting.embed_post_limit
        @posts_left = @topic_view.topic.posts_count - SiteSetting.embed_post_limit - count_diff
      end

      if @topic_view
        @reply_count = @topic_view.topic.posts_count - count_diff
        @reply_count = 0 if @reply_count < 0
      end
    elsif embed_url.present?
      Jobs.enqueue(:retrieve_topic,
                      user_id: current_user.try(:id),
                      embed_url: embed_url,
                      author_username: embed_username,
                      referer: request.env['HTTP_REFERER']
                  )
      render 'loading'
    end

    discourse_expires_in 1.minute
  end
end
