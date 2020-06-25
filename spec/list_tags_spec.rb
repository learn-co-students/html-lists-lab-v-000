require 'pry'

RSpec.describe 'index.html' do
  it 'contains a <ul> tag with the correct <li> tags' do
    ul = parsed_html.search('ul').first
    expect(ul).to_not be_nil, "The main <ul> tag is missing!"
    expect(html_file_contents).to include('</ul>'), "Don't forget to include a closing </ul>"

    children = ul.children.select {|child| child.name == "li"}
    expect(children.length).to be >= 3, "Your <ul> tag needs at least three <li> tags, one for each ingredient"
    expect(children[0].text).to match(/2 slices of bread/)
    expect(children[1]).to match(/4 slices of cheese/)
    expect(children[2]).to match(/1 tbsp of butter/)
  end


  

  it 'contains a <ol> tag' do
    ol = parsed_html.search('ol').first
    expect(ol).to_not be_nil, "Your <ol> tag is missing"
    expect(html_file_contents).to include('</ol>'), "Don't forget to include a closing </ol>"

    children = ol.children.select {|child| child.name == "li"}
    expect(children.length).to be >= 5, "Your <ol> tag needs at least five nested <li> tags"
    expect(children[0]).to match(/Spread butter on bread and frying pan/)
    expect(children[1]).to match(/Place bread in frying pan and fry/)
    expect(children[2]).to match(/Add cheese on top of bread/)
    expect(children[3]).to match(/Cover with second slice of bread/)
    expect(children[4]).to match(/Turn over and fry for 2 minutes/)

  end
end
