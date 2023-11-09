RSpec.describe 'Properties', type: :request do
  let!(:properties) { create_list(:property, 5) }
  let(:property_id) { properties.first.id }

  describe 'GET /properties' do
    before { get '/api/v1/properties' }

    it 'returns properties' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /properties/:id' do
    before { get "/api/v1/properties/#{property_id}" }

    context 'when property exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the property' do
        expect(json['id']).to eq(property_id)
      end
    end

    context 'when property does not exist' do
      let(:property_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Property with 'id'=0")
      end
    end
  end

  describe 'POST /properties' do
    let(:property_params) do
      {
        "properties" => {
          "name" => "Dang!",
          "location" => "SoHo",
          "price" => "900.59",
          "status" => "available"
        }
      }
    end

    context 'when the request is valid' do
      before { post '/api/v1/properties', params: property_params }

      it 'creates a property' do
        expect(json['payload']['name']).to eq('Dang!')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/properties', params: {"properties" => {"name" => ""}}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /properties/:id' do
    let(:property_params) do
      {
        "properties" => {
          "id" => "#{property_id}",
          "name" => "Saffron Swords"
        }
      }
    end

    before { put "/api/v1/properties/#{property_id}", params: property_params }

    context 'when property exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end

      it 'updates the property' do
        expect(json['payload']['name']).to match(/Saffron Swords/)
      end
    end

    context 'when the property does not exist' do
      let(:property_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Property with 'id'=0")
      end
    end
  end

  describe 'DELETE /properties/:id' do
    before { delete "/api/v1/properties/#{property_id}", params: {"properties" => {"id" => "#{property_id}"}}}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
