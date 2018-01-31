defmodule Huffman do
    def sample do
        'the quick brown fox jumps over the lazy dog
        this is a sample text that we will use when we build
        up a table we will only handle lower case letters and
        no punctuation symbols the frequency will of course not
        represent english but it is probably not that far off'
        
    end
    def text do 'this is something that we should encode' end

    def test do
    sample = sample()
    tree = tree(sample)
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
    end
    
    def tree(sample) do
    freq = freq(sample)
    huffman(freq)
    end

    def huffman([hd1,hd2]) do huffmanhelper(hd1,hd2) end
    def huffman([hd1,hd2|tl])do #Enter list with tuples
    huffman(List.keysort([huffmanhelper(hd1,hd2)|tl],1))
    end

    def huffmanhelper({c1,f1},{c2,f2}) do 
    {{c1,c2},f1+f2}
    end

    
    def encode_table({left,right}) do
    # To implement...
    to_map(t_enconder(left,[]),Map.new()) 
    end

    def t_enconder({left,right},list)do
         t_enconder(left,[0|list]) ++ t_enconder(right,[1|list])   
    end
    def t_enconder(c,list) do [{c,Enum.reverse(list)}] end 
    
    def to_map([],map)do map end
    def to_map([{symbol,list}| tl] ,map) do Map.put(to_map(tl,map),symbol,list) end 

    def decode_table(tree) do
    to_map()
    end

    def encode([],tablemap)do [] end
    def encode([hd|tl], tablemap) do
    Map.get(tablemap,hd) ++ encode(tl,tablemap)
    end

    def decode(seq, tree) do
    # To implement...
    end
    
    def freq([],map)do map end
    def freq(sample)do 
    List.keysort(Map.to_list(freq(sample, Map.new())),1) end
    def freq([char|rest], map)do
    freq(rest, Map.update(map, char, 1, &(&1 +1)))end

    end