defmodule Constants.Options do
  @languages ["typescript", "javascript", "python", "ruby", "nodejs", "java"]
  def languages, do: @languages

  @project_types ["Web"]
  def project_types, do: @project_types

  @project_stack_types ["Frontend", "Backend", "Fullstack"]
  def project_stack_types, do: @project_stack_types

  @frontend_technologies ["React", "Vue", "Angular", "Svelte"]
  def frontend_technologies, do: @frontend_technologies

  @backend_technologies ["Nodejs", "Ruby", "Python", "Java"]
  def backend_technologies, do: @backend_technologies

  @fullstack_technologies ["Next.js", "Nuxt.js", "Blitz.js"]
  def fullstack_technologies, do: @fullstack_technologies

  @nodejs_technologies ["ExpressJS", "NestJS", "Fastify"]
  def nodejs_technologies, do: @nodejs_technologies
end

# web - backend - nodejs - Express
