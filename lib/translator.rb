require 'yaml'

def load_library(path)
  emoticons = {}
  YAML.load_file(path).each do |meaning, describe|
    eng, jan = describe
    emoticons[meaning] = {:english => "", :japanese => ""}
    emoticons[meaning][:english] = eng
    emoticons[meaning][:japanese] = jan
  end
  return emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  result = emoticons.select{|key, hash| hash[:english] == emoticon }

  if result
    return result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_meaning"][emoticon] #the same above but change get_meaning
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end

