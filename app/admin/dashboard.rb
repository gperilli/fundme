# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: 'FundMe Dashboard' do
    columns do
      column do
        panel 'Recent Donations' do
          render 'recent_donations'
        end

        panel 'Total Signups' do
          @donations = Donation.all
          @users = User.all

          render 'user_chart'
        end
      end

      column do
        panel 'Info' do
          render 'info'
        end

        panel 'Google Analytics' do
          render 'google_analytics'
        end

        panel 'Donations' do
          render 'donation_chart'
        end
      end
    end
  end

  class Panel < Arbre::Component
    builder_method :panel

    def build(title, attributes = {})
      super(attributes)

      h3(title, class: 'panel-title')
    end
  end
end
