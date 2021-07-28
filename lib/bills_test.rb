# require 'net/http'
# require 'uri'
# require 'json'
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/auth")
#
# request = Net::HTTP::Post.new(uri.request_uri)
#
# request.content_type = "application/json"
# request["Postman-Token"] = "0ccb4c29-56a8-4684-9ccb-054abbb8da29"
# request["Cache-Control"] = "no-cache"
# request.body = { api_key: 'Lzf9kRiEtXNosLsJGxN1ecmx9IbFlZwXWwViCVy6q5pvmhsQCH4a4gIbG0bd',
#                  api_secret: 'BJhOA1tu4RhFArUf84CPK2QFxg59lAQa' }.to_json
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# p "response ------------------------------------------------------------"
# token = JSON.parse(response.body)
# p token['jwt']['token']
#
# require 'net/http'
# require 'uri'
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/empresa/?page=1&limit=50&orderBy=created_at&sort=ASC&search=")
# request = Net::HTTP::Get.new(uri)
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# p "response ------------------------------------------------------------"
# p request
# p response.body


# require 'net/http'
# require 'uri'
#
# data = {
#     "razon_social": "Orlando Valencia",
#     "rfc": "PEVO9202158ME",
#     "email": "mr.landodlp@gmail.com",
#     "forma_de_pago": "99" ,
#     "uso_cfdi": "P01"
# }.to_json
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/cliente")
# request = Net::HTTP::Post.new(uri)
# request.content_type = "application/json"
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
# request.body = data
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# p "response ------------------------------------------------------------"
# p request
#
# response = JSON.parse(response.body)
#
# p response
# p response['data']
# p response['data']['uuid']

# require 'net/http'
# require 'uri'
#
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/cliente/?page=1&limit=50&orderBy=created_at&sort=ASC&search=")
# request = Net::HTTP::Get.new(uri)
# request.content_type = "application/json"
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# p "response ------------------------------------------------------------"
# p request
# p response.body


# require 'net/http'
# require 'uri'
#
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/cliente/?page=1&limit=50&orderBy=created_at&sort=ASC&search=")
# request = Net::HTTP::Get.new(uri)
# request.content_type = "application/json"
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# p "response ------------------------------------------------------------"
# p request
# p response.body


# require 'net/http'
# require 'uri'
#
# date = DateTime.now.strftime('%Y-%m-%d %H:%M:%S').to_s
#
# data = {
#     "emisor": {
#         "uuid": "a92a6a2c-780d-48c8-92b2-4d371929e481",
#         "razon_social": "AGRO TRAILER PLANET SA DE CV",
#         "rfc": "ATP200908A49"
#     },
#     "receptor": {
#         "uuid": "a5e1de67-b2f6-4057-b743-bf93a05c7190",
#         "razon_social": "ALEJANDRO RODRIGUEZ",
#         "rfc": "ROGA940403PT5",
#         "forma_de_pago": "99"
#     },
#     "factura": {
#         "fecha": date,
#         "tipo": "ingreso",
#         "generacion_automatica": true,
#         "subtotal": 2000,
#         "impuesto_federal": 320,
#         "total": 2320,
#         "conceptos": [
#             {
#                 "clave_producto_servicio": "76111500",
#                 "clave_unidad_de_medida": "E48",
#                 "cantidad": 1,
#                 "descripcion": "SERVICIO DE LIMPIEZA",
#                 "valor_unitario": 2000,
#                 "total": 2000
#             }
#         ]
#     }
# }.to_json
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/factura")
# request = Net::HTTP::Post.new(uri)
# request.content_type = "application/json"
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
# request.body = data
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# p "response ------------------------------------------------------------"
# p request
# p response.body



# require 'net/http'
# require 'uri'
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/factura/90D009BA-AE7E-4C3D-A535-9EDB7640B020/pdf/")
# request = Net::HTTP::Get.new(uri)
# request.content_type = "application/json"
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# url_response = JSON.parse(response.body)
#
# p "response ------------------------------------------------------------"
# p request
# p url_response['url']


# require 'net/http'
# require 'uri'
#
# data = {
#     "empresa_uuid": "a92a6a2c-780d-48c8-92b2-4d371929e481",
#     "configuraciones": [
#         {
#             "key": "color_tabla",
#             "value": "#000000"
#         },
#         {
#             "key": "color_texto",
#             "value": "#FFFFFF"
#         }
#
#     ]
# }.to_json
#
# uri = URI.parse("https://api-sandbox.facturify.com/api/v1/configuracion")
# request = Net::HTTP::Post.new(uri)
# request.content_type = "application/json"
# request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
# request["Cache-Control"] = "no-cache"
# request.body = data
#
# req_options = {
#     use_ssl: uri.scheme == "https",
# }
#
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
#
# url_response = JSON.parse(response.body)
#
# p "response ------------------------------------------------------------"
# p request
# p url_response['url']
require 'net/http'
require 'uri'
require 'json'
require 'active_support/core_ext'


uri = URI.parse("https://api-sandbox.facturify.com/api/v1/factura/54AC4BA7-F565-4449-BCEF-CCC41E2E9411")
request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
request["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXNhbmRib3guZmFjdHVyaWZ5LmNvbVwvYXBpXC92MVwvdG9rZW5cL3JlZnJlc2giLCJpYXQiOjE2MjUwODUzODMsImV4cCI6MTYyNzY5MDU3OCwibmJmIjoxNjI1MDk4NTc4LCJqdGkiOiJmTTZDbHZDRFNwM2Npc2pyIiwic3ViIjoxMDg1fQ.mdS-y9BK9KVcw5zebB04YNr4QNOR_13FjdXYYHdXhUlO092WedD_aiabIsxO0MEhama9ipIV3WlAW3nSUf5siw"
request["Cache-Control"] = "no-cache"

req_options = {
    use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

url_response = JSON.parse(response.body)

base_64 = Base64.decode64(url_response['data']['xml'])

hash_json = Hash.from_xml(base_64)
p "response ------------------------------------------------------------"
p hash_json


