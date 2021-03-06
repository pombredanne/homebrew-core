class AidaHeader < Formula
  desc "Abstract Interfaces for Data Analysis define interfaces for physics analysis"
  homepage "https://aida.freehep.org/index.thtml"
  url "ftp://ftp.slac.stanford.edu/software/freehep/AIDA/v3.2.1/aida-3.2.1-src.tar.gz"
  sha256 "882d351bc09e830ae2eb512a2cbf44af5a82ef8efe31fbe0d047363da8314c81"
  license "LGPL-3.0-or-later"

  bottle do
    cellar :any_skip_relocation
    sha256 "eba4b33299b9ed8ed988c4c17fbffe1e17364a7d284878247c3b0a738fe2b340" => :big_sur
    sha256 "50a1e944d768d3f6b5d8dcaf8d074d821272056104369e85f72539c628b770f2" => :catalina
    sha256 "d4559d46451c98728a32679f6d62b7ee4c9a5fa57c18e7ba9315e33d2e7150b8" => :mojave
  end

  def install
    include.install "src/cpp/AIDA"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <AIDA/AIDA.h>

      int main() {
        std::cout<<"AIDA version "<<AIDA_VERSION<<std::endl;
        return 0;
      }
    EOS

    system ENV.cxx, "test.cpp", "-I#{include}"
    assert_match "AIDA version 3.2.1", shell_output("./a.out")
  end
end
