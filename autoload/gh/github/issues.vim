" github
" Author: skanehira
" License: MIT

let s:Promise = vital#vital#import('Async.Promise')

function! gh#github#issues#list(owner, repo, param) abort
  let settings = #{
        \ method: 'GET',
        \ url: printf('https://api.github.com/repos/%s/%s/issues', a:owner, a:repo),
        \ param: a:param,
        \ }
  return gh#http#request(settings)
endfunction

function! gh#github#issues#issue(owner, repo, number) abort
  return gh#http#get(printf('https://api.github.com/repos/%s/%s/issues/%s', a:owner, a:repo, a:number))
endfunction

function! gh#github#issues#new(owner, repo, data) abort
  let settings = #{
        \ method: 'POST',
        \ url: printf('https://api.github.com/repos/%s/%s/issues', a:owner, a:repo),
        \ data: a:data,
        \ }
  return gh#http#request(settings)
endfunction

function! gh#github#issues#update(owner, repo, number, data) abort
  let settings = #{
        \ method: 'PATCH',
        \ url: printf('https://api.github.com/repos/%s/%s/issues/%s', a:owner, a:repo, a:number),
        \ data: a:data,
        \ }
  return gh#http#request(settings)
endfunction
