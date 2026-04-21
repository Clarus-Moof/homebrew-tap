class Applemailmcp < Formula
  desc "Local MCP server for Apple Mail with Contacts integration"
  homepage "https://github.com/Clarus-Moof/AppleMailMCP"
  url "https://github.com/Clarus-Moof/AppleMailMCP/releases/download/v1.0.4/AppleMailMCP-1.0.4.zip"
  sha256 "553f9b60b62a9fde142371f5d6bfcd859dbad47c560eb59248d6c799cc9dd1b5"
  version "1.0.4"
  license "MIT"

  on_macos do
    depends_on :macos => :sonoma
  end

  def install
    bin.install "AppleMailMCP"
  end

  def caveats
    <<~EOS
      AppleMailMCP is a local MCP server for Apple Mail.

      Add to your MCP client config (e.g. ~/.lmstudio/mcp.json):

        {
          "mcpServers": {
            "apple-mail": {
              "command": "#{bin}/AppleMailMCP",
              "args": []
            }
          }
        }

      On first use, macOS will ask for permission to access Mail and Contacts.
    EOS
  end

  test do
    assert_predicate bin/"AppleMailMCP", :executable?
  end
end
