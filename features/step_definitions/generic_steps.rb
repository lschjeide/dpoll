def find_a_button name
  begin
    return find_button(name)
  rescue
  end

  begin
    return find_link(name)
  rescue
  end

  begin
    return find(".#{label_to_class(name)}")
  rescue
  end

  return find(".#{name.downcase.split.first}")
end