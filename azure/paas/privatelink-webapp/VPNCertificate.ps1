$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature -Subject "CN=4soP2SRootCertificate" -CertStoreLocation "Cert:\CurrentUser\My" -HashAlgorithm sha256 -KeyLength 2048 -KeyUsage CertSign

Write-Host $cert

New-SelfSignedCertificate -Type Custom -DnsName P2SChildCert -KeySpec Signature -Subject "CN=4soP2SChildCertificate" -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -HashAlgorithm sha256 -Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

