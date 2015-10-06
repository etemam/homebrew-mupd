class Libldap < Formula
  desc "Ldap libs from openldap"
  homepage "http://www.openldap.org/"
  url "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.42.tgz"
  version "2.4.42"
  sha256 "eeb7b0e2c5852bfd2650e83909bb6152835c0b862fab10b63954dc1bcbba8e63"

  def install
    system "./configure", "--disable-debug",
                          "--disable-slapd",
                          "--enable-shared",
                          "--prefix=#{prefix}"
    system "make"
    mkdir "#{prefix}/lib"
    cp "libraries/libldap/.libs/libldap-2.4.2.10.5.dylib", "#{prefix}/lib/"
    cp "libraries/liblber/.libs/liblber-2.4.2.10.5.dylib", "#{prefix}/lib/"
    ln_s "#{lib}/liblber-2.4.2.10.5.dylib", "#{lib}/liblber.dylib"
    ln_s "#{lib}/liblber-2.4.2.10.5.dylib", "#{lib}/liblber-2.4.2.dylib"
    ln_s "#{lib}/libldap-2.4.2.10.5.dylib", "#{lib}/libldap.dylib"
    ln_s "#{lib}/libldap-2.4.2.10.5.dylib", "#{lib}/libldap-2.4.2.dylib"
    mkdir "#{prefix}/include"
    include.install Dir["include/*"]
  end

end
