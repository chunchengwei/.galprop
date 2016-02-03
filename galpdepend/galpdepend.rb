require '~/.galprop/galpdepend/dependency.rb'
load '~/.galprop/galpdependrc'

GALTOOLIB = { V54: %w(skymap),
              V55: %w(galstruct nuclei processes skymap random utils)
}

deps = { "#{GALPDIRS[:galp]}" => %w(galprop),
         "#{GALPDIRS[:galtool]}" => GALTOOLIB[GALPVERSION.to_sym],
         "#{GALPDIRS[:source]}" => [],
         "#{GALPDIRS[:packages]}" => PACKAGES,
}
deps.merge!(EXTRA)

order = %w(galpwrapper galprop CCfits CLHEP cfitsio)

depend = Depend.new(deps, order, GALP_DEF_FLAG)
depend.addinc(ADDINC)
depend.addlib(ADDLIB)
DEPEND = depend
