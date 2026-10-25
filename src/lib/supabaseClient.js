import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const isSupabaseConfigured = Boolean(url && anonKey)

// Quando as variáveis não existem, exportamos null e o app mostra a tela de
// configuração (SetupNotice) em vez de quebrar.
export const supabase = isSupabaseConfigured ? createClient(url, anonKey) : null
