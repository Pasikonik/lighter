ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    div class: "panels area" do
      columns do
        column max_width: '100px' do
          panel "Videos" do
            para Video.all.count.to_s
          end
        end

        column max_width: '100px' do
          panel "Images" do
            para Image.all.count.to_s
          end
        end

        column max_width: '100px' do
          panel "Tutorials" do
            para Tutorial.all.count.to_s
          end
        end

        column max_width: '100px' do
          panel "Users" do
            para User.all.count.to_s
          end
        end
      end
    end

  end
end
    