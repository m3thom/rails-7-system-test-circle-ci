require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { content: @article.content, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end

  test "should show article pdf" do
    get pdf_article_url(@article)
    assert_includes response.header['Content-Disposition'], "article-#{@article.id}.pdf"
    assert_includes response.header['Content-Type'], "application/pdf"
  end

  test "should create article 1" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 2" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 3" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 4" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 5" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 6" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 7" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 8" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 9" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 10" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 11" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 12" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 13" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 14" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 15" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 16" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 17" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 18" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 19" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 20" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 21" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 22" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 23" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 24" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 25" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 26" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 27" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 28" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 29" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 30" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 31" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 32" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 33" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 34" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 35" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 36" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 37" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 38" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 39" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 40" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 41" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 42" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 43" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 44" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 45" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 46" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 47" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 48" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 49" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article 50" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { content: @article.content, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end
end
