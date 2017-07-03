require 'chefspec'

describe 'chefspec-render-file::default' do
  let(:config_path) {'/etc/config.conf'}

  context 'with default node attributes' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'oracle', version: '7.2').converge(described_recipe)
    end

    it 'deletes the config file' do
      expect(chef_run).to delete_file(config_path)
    end

    context 'with the optional attribute set' do
      let(:setting) {'some_value'}

      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'oracle', version: '7.2') do |node|
          node.override['chefspec-render-file']['setting'] = setting
        end.converge(described_recipe)
      end

      it 'creates the config file' do
        expect(chef_run).to_not delete_file(config_path)
        expect(chef_run).to create_template(config_path)
        expect(chef_run).to render_file(config_path).with_content(/#{setting}/)
      end
    end
  end
end
