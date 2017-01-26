# https://leetcode.com/problems/ransom-note/

=begin
    Rebuild ransom_note using characters from magazine, after a character is used
    in magazine, slice! it from magazine.
    This ensures that the same character is not used twice
    Compare ransom_note_copy and ransom_note at end
=end

def can_construct(ransom_note, magazine)
    ransom_note_copy = ""
        
    ransom_note.length.times do |x|
        if ind = magazine.index(ransom_note[x])
            ransom_note_copy += ransom_note[x]
            magazine.slice!(ind)
        end
    end
    
    if ransom_note_copy == ransom_note
        true
    else
        false
    end
end