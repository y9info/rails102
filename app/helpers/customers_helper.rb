module CustomersHelper
    def visit(website)
        if website =~ /^(?i)https?:\/\//
            link_to website
            else
                link_to website, "https://" + website.to_s, target:"_blank"
        end
    end

end
