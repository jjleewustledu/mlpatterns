classdef BuilderClient

    methods (Static)
        function prd = domakeProduct()
            director = mlpatterns.BuilderDirector( ...
                mlpatterns.BuilderImpl());
            prd = director.construct;
        end
    end
end