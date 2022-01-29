from django.views.generic import TemplateView


class MainView(TemplateView):

    template_name = 'index.html'

    def get(self, request, *args, **kwargs):
        context = self.get_context_data(**kwargs)
        search_query = request.GET.get('search_box')
        context['search'] = search_query
        return self.render_to_response(context)
