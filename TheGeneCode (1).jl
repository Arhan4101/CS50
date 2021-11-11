### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ a532a4b0-c52a-11eb-2f34-1db76b0d94db
begin
	using Pkg
	Pkg.activate(mktempdir())
	Pkg.add([
			Pkg.PackageSpec(name="Compose",version="0.9"),
			Pkg.PackageSpec(name="Colors",version="0.12"),
			Pkg.PackageSpec(name="PlutoUI",version="0.7"),
			])

	using Colors
	using PlutoUI
	using Compose
	using LinearAlgebra
end

# ╔═╡ 8502a2f7-8d87-4131-8a8a-2557090e21b8
md"""# The Gene Code

This program was written in response to the following question from Assignment 2 :

4.	In the famous book by Michael Crichton entitled “ Jurassic Park” a dinosaur is reconstructed by Dinosaur sequence that had been evolutionary preserved in Amber, a  resin. On page 103 of this book (1993 Edition) the author gives the sequence of this DNA. The first 20 bases are :

GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC

(a) What would be the protein sequence corresponding to this DNA piece, starting from the first base. If you wanted to achieve the same protein sequence but the first 9 nucleotide bases had to be   different from the original nucleotide sequence, give any one possible alternate to the first 9 bases.


The main program is designed to return the protein sequence coded for by the  sequence of base pairs. 

To do this, we need to map each codon to its respective protein. This can be done easily using dictionaries in Julia. We have defined a dictionary that maps a set of codons to proteins. Having done this, the computer can now return to you the corresponding protein if you type in a sequence of 3 base pairs.

However, this is not enough for our use case. We need to be able to take in a long sequence of base pairs and return a sequence of proteins. To do this, we simply break the problem into smaller pieces using a for loop. In this loop, we access the sequence of base pairs and extract 3 base pairs in one iteration (all 3s are stored in a list) and, each iteration returns the protein corresponding to the base pair. This loop runs over the entire sequence of base pairs and constructs our required protein sequence. The output to this can be seen below. Having done this, it's quite simple to generate an alternate DNA sequence which would code for the same proteins- one simply needs to look at the protein and, filtering out the codon itself, pick a random codon from the list of alternate codons. A program to generate alternate base pair sequences outputting the same protein sequence can be found further down, the output of a program generating an alternate DNA sequence with the first 9 codons being different, can be found right below.

Having solved the core question, I have since then spent some time tinkering with the other different things that I can do with programming, around this topic. These programs are included here in a fairly disorganised manner, but I've tried to keep the program names descriptive.

"""

# ╔═╡ 963704f8-78f9-4a4b-8b71-5e615f9b4cac
md"""
Scroll across to see the protein sequence coded for by the DNA sequence from the question
"""

# ╔═╡ 3356539c-4891-4c06-b26d-8d21a1921980
md"""
This here is an alternate DNA sequence (with first 3 codons altered) coding for the same protein sequence as the one in the question. Simply by changing the number passed in the input, you can get an alternate DNA sequence swapping out more of the codons.
"""

# ╔═╡ a15f94af-3131-4bbe-83db-bd06c79b9d94
function CountCodons(BaseSequence::String)
	n = length(BaseSequence)÷3
end

# ╔═╡ aa81dcb8-50a8-46ed-84a3-8c3d8afa325b
CountCodons("GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC")

# ╔═╡ c7255c39-e560-4a08-82d9-8972b4378973
begin
	Phe = ["TTT","TTC"]
	Leu = ["CTT","CTC","CTA","CTG","TTA","TTG"]
	Ile = ["ATT","ATC","ATA"]
	Val = ["GTT","GTC","GTA","GTG"]
	Ser = ["TCA","TCG","TCT","TCC","AGT","AGC"]
	Pro = ["CCA","CCT","CCC","CCG"]
	Thr = ["ACA","ACT","ACG","ACC"]
	Ala = ["GCA","GCT","GCG","GCC"]
	Tyr = ["TAT","TAC"]
	His = ["CAT","CAC"]
	Gln = ["CAA","CAG"]
	Asn = ["AAT","AAC"]
	Lys = ["AAA","AAG"]
	Asp = ["GAT","GAC"]
	Glu = ["GAA","GAG"]
	Cys = ["TGT","TGC"]
	Trp = ["TGG"]
	Arg = ["CGA","CGT","CGG","CGC","AGA","AGG"]
	Gly = ["GGA","GGT","GGC","GGG"]
	Met = ["ATG"]

	Codons = [Phe, Leu, Ile, Val, Ser, Pro, Thr, Ala, Tyr, His, Gln, Asn, Lys, Asp, Glu, Cys, Trp, Arg, Gly, Met]
	
	Proteins = ["Phe", "Leu", "Ile", "Val", "Ser", "Pro", "Thr", "Ala", "Tyr", "His", "Gln", "Asn", "Lys", "Asp", "Glu", "Cys", "Trp", "Arg", "Gly", "Met"]
	ProteinDict = Dict(Codons .=> Proteins)
end

# ╔═╡ 96e712fb-89f4-4f95-b288-71f7c30ab42e
function FindProtein(Codon::String)
	for (Codons,Protein) in pairs(ProteinDict)
		if Codon in Codons
			return Protein
		end
	end
end
			

# ╔═╡ 7b29b1b2-cd50-4fca-a24f-27f0d26b2493
FindProtein("TGG")

# ╔═╡ c2c5ad40-d411-4370-b6b5-35543cb9ab35
function GetCodon(BaseSequence::String,n)
	Codon = BaseSequence[n:n+2]
	return Codon
end
	

# ╔═╡ 95b94c2a-69e8-4244-9322-686192ae709b
t = @bind t Slider(1:58)

# ╔═╡ 1ad59a8e-db53-43c7-8f5e-ee6d52cbb988
GetCodon("GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC",t)	

# ╔═╡ d3b5590c-a1ee-4217-a57a-2f203fb13dec
function Get_Codon_List(BaseSequence::String)
	CodonList = []
	for i in 1 : 3 : length(BaseSequence)-2 
		Codon =  GetCodon(BaseSequence,i)
		push!(CodonList,Codon)
	end
	return CodonList
end

# ╔═╡ 28648472-3174-4081-9b6d-3d597f993b76
Get_Codon_List("GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC")

# ╔═╡ 0cd58f42-0930-4d5d-be08-b0dc83cf7609
function GetProteinSequence(BaseSequence::String)
	ProteinSequence = []
	CodonSet = Get_Codon_List(BaseSequence)
	for Codon in CodonSet
		Protein = FindProtein(Codon)
		push!(ProteinSequence,Protein)
	end
	return ProteinSequence
end

# ╔═╡ 744e79a1-d343-4f7d-9fb8-11f869df7901
GetProteinSequence("GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC")

# ╔═╡ 0e9d4ac0-3122-4b4a-948b-971951239764
function Convert_mRNA_to_Sense(Bases::String)
	DNA_Strand = replace(Bases,"U" => "T")
	return DNA_Strand
end

# ╔═╡ afc0e8e1-81c9-4c99-9659-70a81a7f9977
begin
	BasesOfSequence = ["A","T","C","G"]
	BasesOfSenseStrand = ["T","A","G","C"]
	ConversionDict = Dict(BasesOfSequence .=> BasesOfSenseStrand)
end

# ╔═╡ 1d3f208d-e51d-4c87-b055-b2786d18daab
function GetBasePair(Base::Char)
	for (BaseOfSequence,BaseOfSenseStrand) in pairs(ConversionDict)
		if Base in BaseOfSequence
			return BaseOfSenseStrand
		end
	end
end

# ╔═╡ 36d37c36-ff7d-4661-a58b-4d3598dfef33
GetBasePair('A')

# ╔═╡ 08f21d41-55b9-432f-a4c7-b1f0cf452e68
function GetSenseStrand(Bases::String)
	SenseStrand = ""
	for i in Bases
		SenseStrand = SenseStrand*GetBasePair(i)
	end
	return SenseStrand
end
	

# ╔═╡ caae5c17-fb4f-4783-a77b-915ece9c2f31
GetSenseStrand("GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC")

# ╔═╡ fa65f3d0-b53f-453b-b5fe-0f38ebf22898
function Replace_with_same_protein(Codon::String)
	for (Codons,Protein) in pairs(ProteinDict)
		if Codon in Codons
			Other_Codons = filter(x->x!=Codon,Codons)
			New_Codon = rand(Other_Codons)
			return New_Codon
		end
	end
end

	

# ╔═╡ f05b40b0-f1bf-4449-af66-4ceed6009673
Replace_with_same_protein("GGT")

# ╔═╡ c4b71116-3317-4d52-b63f-c36446e391fc
function AlternateDNASequence(Sequence::String,n::Int64)
	Alternate_Codons = Get_Codon_List(Sequence)
	for i in 1:n
		Alternate_Codons[i] = Replace_with_same_protein(Alternate_Codons[i])
	end
	AlternateDNASequence = ""
	for i in Alternate_Codons
		AlternateDNASequence = AlternateDNASequence*i
	end
	return AlternateDNASequence,Alternate_Codons
end
	

# ╔═╡ 699035e4-49d6-4218-b3e6-1c8d26fc04bf
AlternateDNASequence("GCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGC",3)

# ╔═╡ Cell order:
# ╟─8502a2f7-8d87-4131-8a8a-2557090e21b8
# ╠═744e79a1-d343-4f7d-9fb8-11f869df7901
# ╟─963704f8-78f9-4a4b-8b71-5e615f9b4cac
# ╠═699035e4-49d6-4218-b3e6-1c8d26fc04bf
# ╟─3356539c-4891-4c06-b26d-8d21a1921980
# ╠═a532a4b0-c52a-11eb-2f34-1db76b0d94db
# ╠═a15f94af-3131-4bbe-83db-bd06c79b9d94
# ╠═aa81dcb8-50a8-46ed-84a3-8c3d8afa325b
# ╠═c7255c39-e560-4a08-82d9-8972b4378973
# ╠═96e712fb-89f4-4f95-b288-71f7c30ab42e
# ╠═7b29b1b2-cd50-4fca-a24f-27f0d26b2493
# ╠═c2c5ad40-d411-4370-b6b5-35543cb9ab35
# ╠═95b94c2a-69e8-4244-9322-686192ae709b
# ╠═1ad59a8e-db53-43c7-8f5e-ee6d52cbb988
# ╠═d3b5590c-a1ee-4217-a57a-2f203fb13dec
# ╠═28648472-3174-4081-9b6d-3d597f993b76
# ╠═0cd58f42-0930-4d5d-be08-b0dc83cf7609
# ╠═0e9d4ac0-3122-4b4a-948b-971951239764
# ╠═afc0e8e1-81c9-4c99-9659-70a81a7f9977
# ╠═1d3f208d-e51d-4c87-b055-b2786d18daab
# ╠═36d37c36-ff7d-4661-a58b-4d3598dfef33
# ╠═08f21d41-55b9-432f-a4c7-b1f0cf452e68
# ╠═caae5c17-fb4f-4783-a77b-915ece9c2f31
# ╠═fa65f3d0-b53f-453b-b5fe-0f38ebf22898
# ╠═f05b40b0-f1bf-4449-af66-4ceed6009673
# ╠═c4b71116-3317-4d52-b63f-c36446e391fc
