ENV["GKSwstype"] = "100"  # set 'GR environment' to 'no output' (for Travis CI)
using Documenter, ProblemSolving

DocMeta.setdocmeta!(ProblemSolving, :DocTestSetup,
                   :(using ProblemSolving); recursive=true)

# generate Literate documentation
# include("generate.jl")

makedocs(
    format = Documenter.HTML(prettyurls = haskey(ENV, "GITHUB_ACTIONS"),  # disable for local builds
                             collapselevel = 1),
    sitename = "ProblemSolving.jl",
    doctest = false,
    strict = false,
    pages = ["Introduction" => "index.md",
        "Problems" => "problems.md",
        "Hints" => "hints.md",
        "Solutions" => "problems.md"
    ]
)

# Deploy built documentation from Travis.
deploydocs(
    repo = "github.com/mforets/ProblemSolving.jl.git",
    push_preview = true,
)
