module Octokit
  class Client
    # Methods for the Releases API
    #
    # @see https://developer.github.com/v3/repos/releases/
    module Releases

      # Get a single release
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param release_id [Integer] The ID of the release
      # @return [Sawyer::Resource] A single release
      # @see https://developer.github.com/v3/repos/releases/#get-a-single-release
      def release(repo, release_id, options = {})
        get "#{Repository.path repo}/releases/#{release_id}", options
      end

      # List releases for a repository
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @return [Array<Sawyer::Resource>] A list of releases
      # @see https://developer.github.com/v3/repos/releases/#list-releases-for-a-repository
      def releases(repo, options = {})
        paginate "#{Repository.path repo}/releases", options
      end

      # Create a release
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param tag_name [String] The name of the tag.
      # @option options [String] :target_commitish Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually `master`).
      # @option options [String] :name The name of the release.
      # @option options [String] :body Text describing the contents of the tag.
      # @option options [Boolean] :draft `true` to create a draft (unpublished) release, `false` to create a published one.
      # @option options [Boolean] :prerelease `true` to identify the release as a prerelease. `false` to identify the release as a full release.
      # @return [Sawyer::Resource] The new release
      # @see https://developer.github.com/v3/repos/releases/#create-a-release
      def create_release(repo, tag_name, options = {})
        options[:tag_name] = tag_name
        post "#{Repository.path repo}/releases", options
      end

      # Edit a release
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param release_id [Integer] The ID of the release
      # @option options [String] :tag_name The name of the tag.
      # @option options [String] :target_commitish Specifies the commitish value that determines where the Git tag is created from. Can be any branch or commit SHA. Unused if the Git tag already exists. Default: the repository's default branch (usually `master`).
      # @option options [String] :name The name of the release.
      # @option options [String] :body Text describing the contents of the tag.
      # @option options [Boolean] :draft `true` makes the release a draft, and `false` publishes the release.
      # @option options [Boolean] :prerelease `true` to identify the release as a prerelease, `false` to identify the release as a full release.
      # @return [Sawyer::Resource] 
      # @see https://developer.github.com/v3/repos/releases/#edit-a-release
      def update_release(repo, release_id, options = {})
        patch "#{Repository.path repo}/releases/#{release_id}", options
      end

      # Delete a release
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param release_id [Integer] The ID of the release
      # @return [Boolean] True on success, false otherwise
      # @see https://developer.github.com/v3/repos/releases/#delete-a-release
      def delete_release(repo, release_id, options = {})
        boolean_from_response :delete, "#{Repository.path repo}/releases/#{release_id}", options
      end

      # Get the latest release
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @return [Sawyer::Resource] The latest release
      # @see https://developer.github.com/v3/repos/releases/#get-the-latest-release
      def latest_release(repo, options = {})
        get "#{Repository.path repo}/releases/latest", options
      end

      # Get a single release asset
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param asset_id [Integer] The ID of the asset
      # @return [Sawyer::Resource] A single release asset
      # @see https://developer.github.com/v3/repos/releases/#get-a-single-release-asset
      def release_asset(repo, asset_id, options = {})
        get "#{Repository.path repo}/releases/assets/#{asset_id}", options
      end

      # List assets for a release
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param release_id [Integer] The ID of the release
      # @return [Array<Sawyer::Resource>] A list of release assets
      # @see https://developer.github.com/v3/repos/releases/#list-assets-for-a-release
      def release_assets(repo, release_id, options = {})
        paginate "#{Repository.path repo}/releases/#{release_id}/assets", options
      end

      # Edit a release asset
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param asset_id [Integer] The ID of the asset
      # @option options [String] :name The file name of the asset.
      # @option options [String] :label An alternate short description of the asset. Used in place of the filename.
      # @return [Sawyer::Resource] 
      # @see https://developer.github.com/v3/repos/releases/#edit-a-release-asset
      def update_release_asset(repo, asset_id, options = {})
        patch "#{Repository.path repo}/releases/assets/#{asset_id}", options
      end

      # Delete a release asset
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param asset_id [Integer] The ID of the asset
      # @return [Boolean] True on success, false otherwise
      # @see https://developer.github.com/v3/repos/releases/#delete-a-release-asset
      def delete_release_asset(repo, asset_id, options = {})
        boolean_from_response :delete, "#{Repository.path repo}/releases/assets/#{asset_id}", options
      end

      # Get a release by tag name
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param tag [String] tag parameter
      # @return [Sawyer::Resource] A single release by tag
      # @see https://developer.github.com/v3/repos/releases/#get-a-release-by-tag-name
      def release_by_tag(repo, tag, options = {})
        get "#{Repository.path repo}/releases/tags/#{tag}", options
      end
    end
  end
end
